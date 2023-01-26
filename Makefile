deps:
	pip install -r requirements.txt

lint:
	flake8 simple_file.py

run:
	python3 simple_file.py
	python3 tests/test_w3schools.py
