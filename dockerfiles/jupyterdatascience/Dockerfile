FROM python:3.6

WORKDIR /jup

COPY video-game-demo.ipynb /jup/video-game-demo.ipynb

COPY DATA.csv /jup/DATA.csv

RUN pip install jupyter -U && pip install jupyterlab

RUN pip install pandas

RUN pip install seaborn

RUN pip install scipy

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]
