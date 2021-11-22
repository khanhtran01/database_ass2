<div class="container">
  <div class="title">Subject</div>
  <table class="table table-hover margin-table">
    <thead>
      <tr>
        <th>Subject Code</th>
        <th>Subject Name</th>
        <th>Manager Name</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($data as $element) : ?>
        <tr>
          <td><?= $element['Subject_Code'] ?></td>
          <td><?= $element['Name'] ?></td>
          <td><?= $element['mng_name'] ?></td>
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
        <td><input type="text" class="form-control" placeholder="Name" require/></td>
        <td><input type="text" class="form-control" placeholder="Degree"/></td>
        <td><input type="text" class="form-control" placeholder="Faculty"/></td>
        <td><input type="text" class="form-control" placeholder="Phone"/></td>
        <td><input type="text" class="form-control" placeholder="Email"/></td>
        <td><input type="text" class="form-control" placeholder="Address"/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>