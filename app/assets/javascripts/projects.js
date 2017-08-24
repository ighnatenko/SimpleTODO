$(document).ready(function() {
    // close modal alert (bootstrap)
    $('.new_project').submit(function() {
        $(".modal").click();
    });

    //hide title and show edit project form
    $('.projects').on('click', ".title_edit", function() {
        $(this).parents(".project").find(".project_title_editing").css('display', 'block');
        $(this).parents(".project").find(".project_title").css('display', 'none');

        return false;
    });

    //show title and hide edit project form
    $('.projects').on('click', ".cancel_update_project_button", function() {
        $(this).parents(".project").find(".project_title_editing").css('display', 'none');
        $(this).parents(".project").find(".project_title").css('display', 'block');

        return false;
    });

    $('.projects').on('click', ".add_list_button", function() {
        var title = prompt("New title");
        var path = "projects/"

        $.ajax({
            type: "post",
            url: path,
            data: { "title": title }
        });
    });

    //sorting tasks
    $('.projects').on('mouseenter', '.task', function() {
        $('.tasks_ul').sortable({
            items: 'li',
            cursor: 'move',
            update: function() {
                $.ajax({
                    url: $(this).attr('update-url-data'),
                    type: 'post',
                    data: $(this).sortable('serialize')
                });
            }
        });
    });
});