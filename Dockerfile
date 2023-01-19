FROM python:3.8.3-alpine
RUN pip install --upgrade pip
RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser
COPY --chown=myuser:myuser requirements.txt requirements.txt
RUN pip install -r requirements.txt
ENV PATH="/home/myuser/.local/bin:${PATH}"
COPY --chown=myuser:myuser . .
CMD [ "python3", "dolar.py", "repote.py","telegram.py", "--host=0.0.0.0", "--port=5000"]