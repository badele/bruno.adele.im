# bruno.adele.im

## Installation

```bash
mkvirtualenv --no-site-packages -p /usr/bin/python2.7 lektor
git clone https://github.com/lektor/lektor
cd lektor
make build-js
pip install --editable .
```

## Edit
```bash
workon lektor
cd bruno.adele.im
lektor server
```

http://bruno.adele.im lektor website source