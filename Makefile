install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=main --cov=calCLI --cov=mylib test_*.py
format:
	black *.py mylib/*.py	
lint:
	pylint --disable=R,C main.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#deploy

all: install lint test format deploy