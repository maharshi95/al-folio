---
layout: page
permalink: /publications/
title: Publications
importance: 3
description: Publications by years in reversed chronological order.
years: [2021, 2019]
nav: true
---

<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
