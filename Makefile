include tacos/Makefile

.PHONY: dry_run
dry_run: build
	$(AWS_DOCKER_RUN) dry_run
