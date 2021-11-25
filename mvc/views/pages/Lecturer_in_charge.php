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
    
      <tr class="relativePos">
        <td><?= $lecturer['Lecturer_ID'] ?></td>
        <td><?= $lecturer['First_Name'] ?></td>
        <td><?= $lecturer['Last_Name'] ?></td>
        <td><?= $lecturer['Role'] ?></td>
        <td><?= $lecturer['Name'] ?></td>
        <td><?= $lecturer['Degree'] ?></td>
        <td><?= $lecturer['Faculty'] ?></td>
        <td><?= $lecturer['Phone'] ?></td>
        <td><?= $lecturer['Email'] ?></td>
        <td><?= $lecturer['Address'] ?> <em onclick="location.href='Edit/remove/<?=$lecturer['Lecturer_ID']?>/7'" class="ti-close btn--close"></em></td>
      </tr>
      <?php endforeach; ?>
  </tbody>
</table>


<table style="width: 100px" class="table table-hover margin-table">
<thead>
<form  class="fix-pos" action="" method="post">
      <tr>
        <td><input type="text" class="form-control" placeholder="ID" require/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>