<div class="title">Lecture In Charge</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th>Lecture ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Role</th>
      <th>Subject Name</th>
      <th>Degree</th>
      <th>Faculty</th>
      <th>Phone</th>
      <th>Email</th>
      <th>Address</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach($data as $lecturer): ?>
    
      <tr>
        <td><?= $lecturer['Lecturer_ID'] ?></td>
        <td><?= $lecturer['First_Name'] ?></td>
        <td><?= $lecturer['Last_Name'] ?></td>
        <td><?= $lecturer['Role'] ?></td>
        <td><?= $lecturer['Name'] ?></td>
        <td><?= $lecturer['Degree'] ?></td>
        <td><?= $lecturer['Faculty'] ?></td>
        <td><?= $lecturer['Phone'] ?></td>
        <td><?= $lecturer['Email'] ?></td>
        <td><?= $lecturer['Address'] ?></td>
      </tr>
      <?php endforeach; ?>
    <!-- <tr> -->
    <!-- </tr> -->

  </tbody>
  <!-- <tbody>
    <div class="a" style="background-color: aqua">
      <input class="submit" type="submit" value="Thêm">
    </div>
    
    
  </tbody> -->
</table>


<table class="table table-hover margin-table">
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