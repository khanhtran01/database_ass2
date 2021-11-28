<div class="title">Exam</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th onclick="location.href='Home/viewHome/5/1'">Exam Code <i class="fas fa-sort"></i></th>
      <th>Subject Code </th>
      <th>Exam Date</th>
      <th>Lecturer Note</th>
      <th>BC Lecturer</th>
      <th>Date of confirmation</th>
      <th>Approve lecturer</th>
      <th>Date of approval</th>

    </tr>
  </thead>
  <tbody>
    <?php foreach ($data as $element) : ?>
      <tr  style="position: relative;">
        <td><?= $element['Exam_Code'] ?></td>
        <td><?= $element['Subject_Code'] ?></td>
        <td><?= $element['Exam_Date'] ?></td>
        <td><?= $element['Lecturer_Note'] ?></td>
        <td><?= $element['BC_Lecturer_ID'] ?></td>
        <td><?= $element['Date_Of_Confirmation'] ?></td>
        <td><?= $element['Apr_Lecturer_ID'] ?></td>
        <td><?= $element['Date_Of_Approval'] ?><em style="position: absolute; right: 0px; top: 0px" onclick="getLink('<?= $element['Exam_Code'] ?>')" class="ti-close btn--close"></em></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>

<table class="table table-hover margin-table">
<thead>
<form class="fix-pos" action="Home/addExam/5" method="post">
      <tr>
        <td><input name="ecode" type="text" class="form-control" placeholder="Exam Code" /></td>
        <td><input name="subcode" type="text" class="form-control" placeholder="Subject Code" /></td>
        <td><input name="edate" type="date" class="form-control" placeholder="Exam Date" /></td>
        <td><input name="note" type="text" class="form-control" placeholder="Lecturer Note"/></td>
        <td><input name="bcid" type="text" class="form-control" placeholder="BC Lecturer ID"/></td>
        <td><input name="datecf" type="date" class="form-control" placeholder="yyyy-mm-dd"/></td>
        <td><input name="aprid" type="text" class="form-control" placeholder="Apr Lecturer ID"/></td>
        <td><input name="dateapp" type="date" class="form-control" placeholder="yyyy-mm-dd"/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>