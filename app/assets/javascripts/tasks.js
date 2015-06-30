function setFormValue(form) {
  $(form).siblings()
}

function setLabelText(label) {
  var currentTd = $(label).closest('td');
  var input = $(currentTd).find('.task-form');

  $(label).val(input.value);
}

$(function() {

  alert('Tasks.js');

  var editTaskInput = $('#edit-mode');
  $(editTaskInput).val(0);

  // New task button
  $('#add-task').click(function(e) {

    e.preventDefault();

    var form = $(this).parent('form');

    $.ajax({
      url: form.attr('action'),
      type: 'POST',
      dataType: 'script'
    });
  });

  var taskTable = $('#tasks');

  // Edit task button
  $('#edit-task-form').on('submit', function(e) {

    alert('WEQWEWQEQWE');

    e.preventDefault();

    var isEditMode = $(editTaskInput).val() == 0 ? false : true;
    // alert(isEditMode);
    isEditMode = !isEditMode;
    $(editTaskInput).val(isEditMode ? 1 : 0);

    // alert(isEditMode);

    if (isEditMode)
      $('#edit-task').prop('value', 'Сохранить изменения');
    else
      $('#edit-task').prop('value', 'Изменить задачу');

    if (!isEditMode)
    {
      var currentTr = $('#tasks').find('input:checked.task-checker').closest('tr');

      var formData = [];
      $(currentTr).find('input').each(function() {
        formData.push({ name: this.name, value: this.value });
      });
      $(currentTr).find('select').each(function() {
        formData.push({ name: this.name, value: this.value });
      });

      var taskForm = $(currentTr).find('form');

      $.ajax({
        url: taskForm.attr('action'),
        type: 'PATCH',
        data: formData,
        dataType: 'script'
        });

    }

    $(taskTable).find('.task-checker').each(function() {

      if ($(this).is(':checked'))
      {
        var currentTr = ($(this).closest('tr'));
        $(currentTr).find('.task-form').each(function() {
          if (isEditMode)
            $(this).show();
          else
            $(this).hide();
        })
        $(currentTr).find('.task-label').each(function() {
          if (isEditMode)
            $(this).hide();
          else
          {
            $(this).show();
            setLabelText(this);
          }
        })
      }
    });
  });

  // Remove task button
  $('#remove-task').click(function(e) {

    e.preventDefault();

    var form = $(this).parent('form');

    var removedRows = [];

    $(taskTable).find('input.task-checker:checked').each(function() {

      var currentTr = ($(this).closest('tr'));
      
      if (removedRows.indexOf(currentTr.attr('id')) != -1)
        return true;

      $.ajax({
        url: form.attr('action') + '/' + currentTr.attr('id'),
        type: 'DELETE',
        data: {
          _method: 'delete'
        },
        dataType: 'script'
        });

      removedRows.push(currentTr.attr('id'));
    });
  });
})