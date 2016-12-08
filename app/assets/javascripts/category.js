$( document ).ready(function() {

     $(".show_category .btn-question").click(function(){
        $(".btn-add-question").attr("disabled","disabled");
        resetForm();
     });

    $(document).on( "click",".show_category a.destroy_duplicate_nested_form",function(){
      $(this).prev(".valueDestroy").val("true");
      $(this).closest('.duplicatable_nested_form').slideUp().remove();
      setLableCorrect();
      showAlertModal();
    });

    $(document).on("click", ".show_category .duplicate_nested_form",function(e){
      formsOnPage    = $('.show_category .duplicatable_nested_form').length;
        newNestedForm="<div class='duplicatable_nested_form col-md-8 col-md-offset-2'>"+
         "<label for='question_answers_attributes_"+formsOnPage+"_content'>Content</label><br>"+
         "<input type='text' name='question[answers_attributes]["+formsOnPage+"][content]' id='question_answers_attributes_"+formsOnPage+"_content' class='form-control' required='true'>"+
         "<input class='valueIsCorrect' type='hidden' name='question[answers_attributes]["+formsOnPage+"][is_correct]' id='question_answers_attributes_0_is_correct' value='false'>"+
         "<input class='valueDestroy' type='hidden' value='false' name='question[answers_attributes][0][_destroy]' id='question_answers_attributes_"+formsOnPage+"__destroy'>"+
        "<a class='destroy_duplicate_nested_form btn btn-danger' href='javascript:void(0)'>remove</a>"+
      "</div>";
      $( ".show_category #areaAnswer").append( newNestedForm);
      showAlertModal();
      setLableCorrect();
    });
    $(document).on("click", ".show_category .btn-add-question",function(e){
      formsOnPage= $('.show_category .duplicatable_nested_form').length;
      if(formsOnPage>0){
        $('.show_category .duplicatable_nested_form:first-child .valueIsCorrect').val("true");
      }
    });

    function resetForm(){
      $(".show_category .form-control").val(" ");
      $( ".show_category #areaAnswer").html("");
    }

    function showAlertModal(){
      formsOnPage= $(".show_category .duplicatable_nested_form").length;
      if(formsOnPage>0){
        $(".show_category .validate-alert").slideUp(50);
        $(".show_category .btn-add-question").removeAttr("disabled","disabled");
      }else{
        $(".show_category .btn-add-question").attr("disabled","disabled");
        $(".show_category .validate-alert").slideDown(50);
      }
      $(".show_category .number-answers").html("Answer("+formsOnPage+")");
    }

    function setLableCorrect(){
      formsOnPage= $('.show_category .duplicatable_nested_form').length;
      if(formsOnPage>0){
        if($(".show_category .lableCorrect").length==0){
          $('.show_category .duplicatable_nested_form:first-child label').after("<p class='lableCorrect'>Please enter correct answer at here</p>");
        }
      }
    }

    $(document).on("click",".show_category .pagination a", function (event) {
        event.preventDefault();
        $.getScript($(this).attr("href"));
        return false;
    });

   $(".show_category #categories_search input").keyup(function() {
    $.get($(".show_category #categories_search").attr("action"), $(".show_category #categories_search").serialize(),null, "script");
    return false;
  });



});


