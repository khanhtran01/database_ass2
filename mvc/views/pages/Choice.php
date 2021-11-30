<div class="container">
  <div class="title">Choice</div>
  <table class="table table-hover margin-table">
    <thead>
      <tr>
        <th  onclick="location.href='Home/viewHome/8/1'">Question ID <i class="fas fa-sort"></i></th>
        <th>Choice ID</th>
        <th>Choice Content</th>
        <th>Description File</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($data as $element) : ?>
        <tr style="position: relative;">
          <td><?= $element['Question_ID'] ?></td>
          <td><?= $element['Choice_ID'] ?></td>
          <td><?= $element['Choice_Content'] ?></td>
          <td><?= $element['File_Path'] ?><em style="position: absolute; right: 0px; top: 0px" onclick="getLink('<?= $element['Question_ID'] ?>')" class="ti-close btn--close"></em></td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>



<table class="table margin-table">
<thead>
<form class="fix-pos" action="Home/addChoice/8" method="post">
      <tr>
        <td><input name="id" type="text" class="form-control" placeholder="Question ID" require/></td>
        <td><input name="cid" type="text" class="form-control" placeholder="Choice ID" require/></td>
        <td><input name="cc" type="text" class="form-control" placeholder="Choice Content" require/></td>
        <td><input name="desid" type="text" class="form-control" placeholder="Content ID"/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>