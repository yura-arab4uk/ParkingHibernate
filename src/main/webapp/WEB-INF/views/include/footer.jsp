<style>
html,
body {
  height: 100%;
  /* The html and body elements cannot have any padding or margin. */
}

/* Wrapper for page content to push down footer */
#wrap {
  min-height: 100%;
  height: auto !important;
  height: 100%;
  /* Negative indent footer by it's height */
  margin: 0 auto;
}

/* Set the fixed height of the footer here */
#push,
#footer {
  height: 60px;
}
#footer {
  background-color: #eee;
}

/* Lastly, apply responsive CSS fixes as necessary */
@media (max-width: 767px) {
#footer {
  margin-left: -20px;
  margin-right: -20px;
  padding-left: 20px;
  padding-right: 20px;
}
}
</style>
<div id="footer">
      <div style="padding-top:20px;" class="container text-center">
        <p class="text-muted">&#9400;Yurii Arabchuk</p>
      </div>
</div>