<div class="title">Exam</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th>Subject Code</th>
      <th>Exam Date</th>
      <th>Exam Code</th>
      <th>Lecturer Note</th>
      <th>BC Lecturer</th>
      <th>Date of confirmation</th>
      <th>Approve lecturer</th>
      <th>Date of approval</th>

    </tr>
  </thead>
  <tbody>
    <?php foreach ($data as $element) : ?>
      <tr>
        <td><?= $element['Subject_Code'] ?></td>
        <td><?= $element['Exam_Date'] ?></td>
        <td><?= $element['Exam_Code'] ?></td>
        <td><?= $element['Lecturer_Note'] ?></td>
        <td><?= $element['BC_Lecturer_ID'] ?></td>
        <td><?= $element['Date_Of_Confirmation'] ?></td>
        <td><?= $element['Apr_Lecturer_ID'] ?></td>
        <td><?= $element['Date_Of_Approval'] ?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
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
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>