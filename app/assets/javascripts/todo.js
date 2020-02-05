window.addEventListener("load", ()=>{
  //HTMLcollectionオブジェクトから配列へ変換
  var tmp = document.getElementsByClassName('todo-check-box');
  var checkboxes = Array.prototype.slice.call(tmp);

  for(var i=0; i<checkboxes.length; i++){
    checkboxes[i].addEventListener('change', e=>{
      e.preventDefault();
      //todoのデータを取得
      var id       = e.target.getAttribute('data-todoid');
      var status   = e.target.checked ? true : false

      //ajaxに必要な情報の取得
      var url      = location.href+"/"+id
      var formData = new FormData();

      formData.append('todo[status]', status);

      var ajax = new XMLHttpRequest();
      ajax.open("PUT",url);
      ajax.send(formData);
      // req.onreadystatechange = ()=>{

      // }
    })
  };
});