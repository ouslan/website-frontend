# blog/views.py

from django.shortcuts import render


def blog_index(request):

    return render(request, "blog/index.html")


def post_1(request):
    return render(request, "blog/posts/1-post.html")
