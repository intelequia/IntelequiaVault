
function closePanel(root) {
    $(root).find("[data-root='" + root + "']").removeClass('active').attr('aria-expanded', false);
    $(root).find('.accordion-collapse').slideUp().removeClass('open');
}

$(document).on("click", "[data-toggle='accordion']", function (e) {
    var root = $(this).data("root");
    var targetPanel = $(this).attr('href');

    if ($(this).hasClass('active')) {
        closePanel(root);
    } else {
        closePanel(root);

        // Add active class to section title
        $(this).addClass('active').attr('aria-expanded', true);
        // Open up the hidden content panel
        $(root).find(targetPanel).slideDown().addClass('open');
    }

    e.preventDefault();
});