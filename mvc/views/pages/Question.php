<div class="title">Question</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th>Question ID <i class="fas fa-sort"></i></th>
      <th>Level</th>
      <th>Content</th>
      <th>Time Contribute</th>
      <th>Correct Choice ID</th>
      <th>Lecturer in charge</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($data as $element) : ?>
      <tr>
        <td><?= $element['Question_ID'] ?></td>
        <td><?= $element['Level'] ?></td>
        <td><?= $element['Content'] ?></td>
        <td><?= $element['Time_Contribute'] ?></td>
        <td><?= $element['Correct_Choice_ID'] ?></td>
        <td><?= $element['fullname'] ?></td>
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
        <td><input type="text" class="form-control" placeholder="Role"/></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>