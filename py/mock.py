import responses
import requests

@responses.activate
def test_my_api():
    responses.add(responses.GET, 'http://twitter.com/api/1/foobar',
                  json={"error": "not found"}, status=404)

    resp = requests.get('http://twitter.com/api/1/foobar')

    assert resp.json() == {"error": "not found"}

    assert len(responses.calls) == 1
    assert responses.calls[0].request.url == 'http://twitter.com/api/1/foobar'
    assert responses.calls[0].response.text == '{"error": "not found"}'

test_my_api()