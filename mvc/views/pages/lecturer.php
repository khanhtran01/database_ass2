<div class="title">Lecture</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th onclick="location.href='Home/viewHome/1/1'">Lecture ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Degree</th>
      <th>Faculty</th>
      <th>Phone</th>
      <th>Email</th>
      <th>Address</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach($data as $lecturer): ?>
    
      <tr style="position: relative;">
        <td><?= $lecturer['Lecturer_ID'] ?></td>
        <td><?= $lecturer['First_Name'] ?></td>
        <td><?= $lecturer['Last_Name'] ?></td>
        <td><?= $lecturer['Degree'] ?></td>
        <td><?= $lecturer['Faculty'] ?></td>
        <td><?= $lecturer['Phone'] ?></td>
        <td><?= $lecturer['Email'] ?></td>
        <td><?= $lecturer['Address'] ?><em style="position: absolute; right: 0px; top: 0px" onclick="getLink(<?= $lecturer['Lecturer_ID'] ?>)" class="ti-close btn--close"></em></td>
      </tr>
      <?php endforeach; ?>
  </tbody>
</table>

<table class="table table-hover margin-table">
<thead>
<form class="fix-pos" action="Home/addLecturer/1" method="post">
      <tr>
        <td><input name="id" type="text" class="form-control" placeholder="ID" require/></td>
        <td><input name="fn" type="text" class="form-control" placeholder="First Name" require/></td>
        <td><input name="ln" type="text" class="form-control" placeholder="Last Name" require/></td>
        <!-- <td><input name="fa" type="text" class="form-control" placeholder="Falcuty"/></td> -->
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
        <!-- <td><input name="de" type="text" class="form-control" placeholder="Degree" require/></td> -->
        <td style="width: 150px">
          <select name="de" class="form-control" placeholder="Degree">
              <option value="Bachelor">Bachelor</option>
              <option value="Master">Master</option>
              <option value="Doctor">Doctor</option>
          </select>
        </td>
        <td><input name="ad" type="text" class="form-control" placeholder="Address"/></td>
        <td><input name="em" type="text" class="form-control" placeholder="Email"/></td>
        <td><input name="ph" type="text" class="form-control" placeholder="Phone"/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>
<script>
  function getLink(id){
    const currUrl = window.location.href;
    const number = currUrl.split('/');
    const pageNumber = number[number.length - 2];
    var link = "Edit/remove/" + id + "/" + pageNumber;
    // alert(link);
    // const link1 = "Home/viewHome/6";
    location.href = link;
  }
</script>