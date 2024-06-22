.PHONY: push_blog

all: push_blog

push_blog:
	@git add .
	@git commit -m "Update blog"
	@git push

