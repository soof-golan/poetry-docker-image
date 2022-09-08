from flask import url_for

def test_api_ping(client):
    res = client.get(url_for('ping'))
    assert res.json == 'pong'
