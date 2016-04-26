#include <SFML/Graphics.hpp>
#include <array>
#include <vector>
#include <thread>

static constexpr int IMAGE_WIDTH = 1000;
static constexpr int IMAGE_HEIGHT = 600;

class Mandelbrot {
public:
    Mandelbrot();
    void updateImage(double zoom, double offsetX, double offsetY, sf::Image& image) const; 
private:
    static const int MAX = 127; // maximum number of iterations for mandelbrot()
                         // don't increase MAX or the colouring will look strange
    std::array<sf::Color, MAX+1> colors;

    int mandelbrot(double startReal, double startImag) const;
    sf::Color getColor(int iterations) const;
    void updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY) const;
};

Mandelbrot::Mandelbrot() {
    for (int i=0; i <= MAX; ++i) {
        colors[i] = getColor(i);
    }
}

int Mandelbrot::mandelbrot(double startReal, double startImag) const {
    double zReal = startReal;
    double zImag = startImag;

    for (int counter = 0; counter < MAX; ++counter) {
        double r2 = zReal * zReal;
        double i2 = zImag * zImag;
        if (r2 + i2 > 4.0) {
            return counter;
        }
        zImag = 2.0 * zReal * zImag + startImag;
        zReal = r2 - i2 + startReal;
    }
    return MAX;
}

sf::Color Mandelbrot::getColor(int iterations) const {
    int r, g, b;

    // colour gradient:      Red -> Blue -> Green -> Red -> Black
    // corresponding values:  0  ->  16  ->  32   -> 64  ->  127 (or -1)
    if (iterations < 16) {
        r = 16 * (16 - iterations);
        g = 0;
        b = 16 * iterations - 1;
    } else if (iterations < 32) {
        r = 0;
        g = 16 * (iterations - 16);
        b = 16 * (32 - iterations) - 1;
    } else if (iterations < 64) {
        r = 8 * (iterations - 32);
        g = 8 * (64 - iterations) - 1;
        b = 0;
    } else { // range is 64 - 127
        r = 255 - (iterations - 64) * 4;
        g = 0;
        b = 0;
    }
    return sf::Color(r, g, b);
}

void Mandelbrot::updateImageSlice(double zoom, double offsetX, double offsetY, sf::Image& image, int minY, int maxY) const
{
    double real = 0 * zoom - IMAGE_WIDTH / 2.0 * zoom + offsetX;
    double imagstart = minY * zoom - IMAGE_HEIGHT / 2.0 * zoom + offsetY;
    for (int x = 0; x < IMAGE_WIDTH; x++, real += zoom) {
        double imag = imagstart;
        for (int y = minY; y < maxY; y++, imag += zoom) {
            int value = mandelbrot(real, imag);
            image.setPixel(x, y, colors[value]);
        }
    }
}

void Mandelbrot::updateImage(double zoom, double offsetX, double offsetY, sf::Image& image) const
{
    const int STEP = IMAGE_HEIGHT/std::thread::hardware_concurrency();
    std::vector<std::thread> threads;
    for (int i = 0; i < IMAGE_HEIGHT; i += STEP) {
        threads.push_back(std::thread(&Mandelbrot::updateImageSlice, *this, zoom, offsetX, offsetY, std::ref(image), i, std::min(i+STEP, IMAGE_HEIGHT)));
    }
    for (auto &t : threads) {
        t.join();
    }
}

int main() {
    double offsetX = -0.7; // and move around
    double offsetY = 0.0;
    double zoom = 0.004; // allow the user to zoom in and out...
    Mandelbrot mb;

    sf::RenderWindow window(sf::VideoMode(IMAGE_WIDTH, IMAGE_HEIGHT), "Mandelbrot");
    window.setFramerateLimit(0);

    sf::Image image;
    image.create(IMAGE_WIDTH, IMAGE_HEIGHT, sf::Color(0, 0, 0));
    sf::Texture texture;
    sf::Sprite sprite;

    bool stateChanged = true; // track whether the image needs to be regenerated

    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            switch (event.type) {
                case sf::Event::Closed:
                    window.close();
                    break;
                case sf::Event::KeyPressed:
                    stateChanged = true; // image needs to be recreated when the user changes zoom or offset
                    switch (event.key.code) {
                        case sf::Keyboard::Escape:
                            window.close();
                            break;
                        case sf::Keyboard::Equal:
                            zoom *= 0.9;
                            break;
                        case sf::Keyboard::Dash:
                            zoom /= 0.9;
                            break;
                        case sf::Keyboard::W:
                            offsetY -= 40 * zoom;
                            break;
                        case sf::Keyboard::S:
                            offsetY += 40 * zoom;
                            break;
                        case sf::Keyboard::A:
                            offsetX -= 40 * zoom;
                            break;
                        case sf::Keyboard::D:
                            offsetX += 40 * zoom;
                            break;
                        default: 
                            stateChanged = false;
                            break;
                    }
                default:
                    break;
            }
        }

        if (stateChanged) { 
            mb.updateImage(zoom, offsetX, offsetY, image);
            texture.loadFromImage(image);
            sprite.setTexture(texture);
            stateChanged = false;
        }
        window.draw(sprite);
        window.display();
    }
}