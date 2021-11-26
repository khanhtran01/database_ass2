<div class="title">Student</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th>Student ID <i class="fas fa-sort"></i></th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Faculty</th>
      <th>Phone</th>
      <th>Email</th>
      <th>Address</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($data as $element) : ?>
      <tr>
        <td><?= $element['Student_ID'] ?></td>
        <td><?= $element['First_Name'] ?></td>
        <td><?= $element['Last_Name'] ?></td>
        <td><?= $element['Faculty'] ?></td>
        <td><?= $element['Phone'] ?></td>
        <td><?= $element['Email'] ?></td>
        <td><?= $element['Address'] ?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>



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