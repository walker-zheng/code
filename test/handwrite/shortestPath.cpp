#include <iostream>

size_t g_num = 0; //统计A点到B点的最短路径条数

void shortestPathNumber(char grid[9][9], int row, int col, int &step)
{
    if (row < 0 || row > 8 || col < 0 || col > 8 || grid[row][col] == '*' || step > 16)
    {
        return;
    }
    if (row == 0 && col == 8)
    {
        if (step == 16) //已到达B点，且等于最短路径16，就累加
        {
            g_num++;
        }
    }
    else
    {
        grid[row][col] = '*'; //标记该点已访问
        step++;

        shortestPathNumber(grid, row, col + 1, step);
        shortestPathNumber(grid, row + 1, col, step);
        shortestPathNumber(grid, row, col - 1, step);
        shortestPathNumber(grid, row - 1, col, step);

        grid[row][col] = '.'; //回溯
        step--;
    }
}

int main()
{
    char grid[9][9] = {0};
    int step = 0;
    shortestPathNumber(grid, 8, 0, step); //从A点开始搜索
    std::cout << "A点到B点的最短路径条数为: " << g_num << std::endl;

    return 0;
}