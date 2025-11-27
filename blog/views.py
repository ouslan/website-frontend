# blog/views.py

from django.shortcuts import render


def blog_index(request):
    return render(request, "blog/index.html")


def blog_category(request):
    return render(request, "blog/category.html")


def blog_detail(request):
    return render(request, "blog/detail.html")
