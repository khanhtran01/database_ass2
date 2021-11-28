<div class="title">Student Choice</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th onclick="location.href='Home/viewHome/9/1'">Student ID <i class="fas fa-sort"></i></th>
      <th>Subject Code</th>
      <th>Exam Date</th>
      <th>Exam Code</th>
      <th>Question Number</th>
      <th>Answer Choice</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($data as $element) : ?>
      <tr  style="position: relative;">
        <td><?= $element['Student_ID'] ?></td>
        <td><?= $element['Subject_Code'] ?></td>
        <td><?= $element['Exam_Date'] ?></td>
        <td><?= $element['Exam_Code'] ?></td>
        <td><?= $element['Answer_Number'] ?></td>
        <td><?= $element['Answer_Choice_IDs'] ?><em style="position: absolute; right: 0px; top: 0px" onclick="getLink(<?= $element['Student_ID'] ?>)" class="ti-close btn--close"></em></td>
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