default: validate flatten

validate:
	find ./recipes/ -maxdepth 1 -type f -name '*.yaml' -exec bluebuild validate {} \;

.PHONY: default validate
