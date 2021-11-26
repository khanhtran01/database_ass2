<div class="container">
  <div class="title">Choice</div>
  <table class="table table-hover margin-table">
    <thead>
      <tr>
        <th>Question ID <i class="fas fa-sort"></i></th>
        <th>Choice ID</th>
        <th>Choice Content</th>
        <th>Description File</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($data as $element) : ?>
        <tr>
          <td><?= $element['Question_ID'] ?></td>
          <td><?= $element['Choice_ID'] ?></td>
          <td><?= $element['Choice_Content'] ?></td>
          <td><?= $element['File_Path'] ?></td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>



<table class="table margin-table">
<thead>
<form class="fix-pos" action="" method="post">
      <tr>
        <td><input type="text" class="form-control" placeholder="ID" require/></td>
        <td><input type="text" class="form-control" placeholder="First Name" require/></td>
        <td><input type="text" class="form-control" placeholder="Last Name" require/></td>
        <td><input type="text" class="form-control" placeholder="Role"/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>