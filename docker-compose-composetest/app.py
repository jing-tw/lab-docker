from flask import Flask   # import the Python microframe Flask class
from redis import Redis   # import the in-memory datastructure store 

# create an Flask app and point to the main function
app = Flask(__name__)

# create a redis instance to connect the 'redis' container server with 6379
redis = Redis(host = 'redis_123', port = 6379)


 
@app.route('/')   # tell Flask the URL '/' will trigger the 'hello' function
def hello():
    redis.incr('hits') # increase the value for the key 'hits'
    return 'Hello World! I have been seen %s times.' %  redis.get('hits')

if __name__ == "__main__":
    app.run(host = "0.0.0.0", debug = True)

