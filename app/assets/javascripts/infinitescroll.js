$(document).ready( function() {
  $(".infinitescroll").infinitescroll({
    navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: ".infinitescroll .infinitescroll-item",
    loading: { msgText: '<em>Loading...</em>' }
  });
});