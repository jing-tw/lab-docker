FROM python:2.7    # crate a image based on phthon 2.7
ADD . /code        # add current directory to the new image folder /code
WORKDIR /code      # setup the /code as working directory
RUN pip install -r requirements.txt     # install the necessay pacakge for your app
CMD python app.py                       # execute your app when docker run
