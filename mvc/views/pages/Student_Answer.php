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
        <td><input name="sid" type="number" class="form-control" placeholder="Student ID" require/></td>
        <td><input name="subcode" type="text" class="form-control" placeholder="Subject Code" require/></td>
        <td><input name="edate" type="date" class="form-control" placeholder="Exam Date" require/></td>
        <td><input name="ecode" type="text" class="form-control" placeholder="Exam Code"/></td>
        <td><input name="ansnumb" type="number" class="form-control" placeholder="Answer Number" require/></td>
        <td><input name="ansno" type="number" class="form-control" placeholder="Answer No"/></td>
        <td><input name="anschoice" type="text" class="form-control" placeholder="Answer Choice"/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>