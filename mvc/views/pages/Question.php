<div class="title">Question</div>
<table class="table table-hover margin-table">
  <thead>
    <tr>
      <th onclick="location.href='Home/viewHome/4/1'">Question ID <i class="fas fa-sort"></i></th>
      <th>Level</th>
      <th>Content</th>
      <th>Time Contribute</th>
      <th>Correct Choice ID</th>
      <th>Lecturer in charge</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($data as $element) : ?>
      <tr  style="position: relative;">
        <td><?= $element['Question_ID'] ?></td>
        <td><?= $element['Level'] ?></td>
        <td><?= $element['Content'] ?></td>
        <td><?= $element['Time_Contribute'] ?></td>
        <td><?= $element['Correct_Choice_ID'] ?></td>
        <td><?= $element['fullname'] ?> <em style="position: absolute; right: 0px; top: 0px" onclick="getLink('<?= $element['Question_ID'] ?>')" class="ti-close btn--close"></em></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>


<table class="table margin-table">
<thead>
<form class="fix-pos" action="Home/addQuestion/4" method="post">
      <tr>
        <td><input name="id" type="text" class="form-control" placeholder="ID" require/></td>
        <td style="width: 300px" ><input name="ctn" type="text" class="form-control" placeholder="Content" /></td>
        <td style="width: 150px">
          <select name="lv" class="form-control" placeholder="level">
              <option value="Easy">Easy</option>
              <option value="Medium">Medium</option>
              <option value="Difficult">Difficult</option>
          </select>
        </td>
        <td><input name="crid" type="text" class="form-control" placeholder="Correct Choice"/></td>
        <td><input name="desid" type="text" class="form-control" placeholder="Described content ID"/></td>
        <td><input name="ctbid" type="text" class="form-control" placeholder="Contribute ID" /></td>
        <td><input name="outcome" type="text" class="form-control" placeholder="Out Come" /></td>
        <td><input name="subcode" type="text" class="form-control" placeholder="Subject Code" /></td>
      </tr>
        <input class="abs-pos" type="submit" value="Thêm">
</form>
</thead>
</table>