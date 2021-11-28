<div class="container">
  <div class="title">Subject</div>
  <div>
  <table class="table table-hover margin-table">
    <thead>
      <tr>
        <th onclick="location.href='Home/viewHome/3/1'">Subject Code <i class="fas fa-sort"></i></th>
        <th>Subject Name</th>
        <th>Manager Name</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($data as $element) : ?>
        <tr style="position: relative;">
          <td><?= $element['Subject_Code'] ?></td>
          <td><?= $element['Name'] ?></td>
          <td><?= $element['mng_name'] ?> <em style="position: absolute; right: 0px; top: 0px" onclick="getLink('<?= $element['Subject_Code'] ?>')" class="ti-close btn--close"></em></td>
          
          
          
          
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
  </div>
  
</div>



<table class="table margin-table">
<thead>
<form class="fix-pos" action="Home/addSubject/3" method="post">
      <tr>
        <td><input name="subjectcode" type="text" class="form-control" placeholder="Subject Code" require/></td>
        <td><input name="name" type="text" class="form-control" placeholder="Subject Name" require/></td>
        <td><input name="lecturerid" type="text" class="form-control" placeholder="Manager Lecturer ID" require/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>