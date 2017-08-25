$(document).ready(function() {
    $('.projects').on('click', ".edit_list_img", function() {
        var task_id = $(this).parents("li").attr("id");

        $(this).parents("#" + task_id).find(".task_update").css('display', 'block');
        $(this).parents("#" + task_id).find(".task_row").css('display', 'none');

        return false;
    });

    $('.projects').on('click', ".cancel_update_project_button", function() {
        var task_id = $(this).parents("li").attr("id");

        $(this).parents("#" + task_id).find(".task_update").css('display', 'none');
        $(this).parents("#" + task_id).find(".task_row").css('display', 'block');

        return false;
    });

    //checkbox
    $('.projects').on('change', '.checkbox', function() {
        var projectId = $(this).parents(".project").attr("id");
        var taskId = $(this).parents(".task").attr("id").substring(5, 9999);
        var path = "projects/" + projectId + "/tasks/" + taskId;
        var done = $(this).parents(".task").find(".checkbox").prop("checked");
        $.ajax({
            type: "put",
            url: path,
            data: { "task[done]": done }
        });
        return false;
    });
});