<div class="title">Student</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th  onclick="location.href='Home/viewHome/2/1'">Student ID <i class="fas fa-sort"></i></th>
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
      <tr style="position: relative;">
        <td><?= $element['Student_ID'] ?></td>
        <td><?= $element['First_Name'] ?></td>
        <td><?= $element['Last_Name'] ?></td>
        <td><?= $element['Faculty'] ?></td>
        <td><?= $element['Phone'] ?></td>
        <td><?= $element['Email'] ?></td>
        <td><?= $element['Address'] ?><em style="position: absolute; right: 0px; top: 0px" onclick="getLink('<?= $element['Student_ID'] ?>')" class="ti-close btn--close"></em></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>



<table class="table margin-table">
<thead>
<form class="fix-pos" action="Home/addStudent/2" method="post">
      <tr>
        <td><input name="id" type="number" class="form-control" placeholder="ID" require/></td>
        <td><input name="fn" type="text" class="form-control" placeholder="First Name" require/></td>
        <td><input name="ln" type="text" class="form-control" placeholder="Last Name" require/></td>
        <td style="width: 300px">
          <select name="fa" class="form-control" placeholder="Faculty">
              <option value="Computer Science & Engineering">Computer Science & Engineering</option>
              <option value="Electrical & Electronic Engineering">Electrical & Electronic Engineering</option>
              <option value="Chemical Technology">Chemical Technology</option>
              <option value="Mechanical Engineering">Mechanical Engineering</option>
              <option value="Civil Engineering">Civil Engineering</option>
              <option value="Applied Science">Applied Science</option>
              <option value="Industrial Management">Industrial Management</option>
              <option value="Environment">Environment</option>
              <option value="Geology & Petroleum Engineering">Geology & Petroleum Engineering</option>
              <option value="Transportation  Engineering">Transportation  Engineering</option>
              <option value="Materials Technology">Materials Technology</option>
          </select>
        </td>
        <td><input name="ph" type="text" class="form-control" placeholder="Phone" require/></td>
        <td><input name="em" type="email" class="form-control" placeholder="Email" require/></td>
        <td><input name="ad" type="text" class="form-control" placeholder="Address"require/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>