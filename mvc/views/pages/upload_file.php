<div class="container">
  <div class="title">Description File</div>
  <table class="table table-hover margin-table">
    <thead>
      <tr>
        <th>File path</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($data as $element) : ?>
        <tr style="position: relative;">
          <td><?= $element['File_Path'] ?><em style="position: absolute; right: 0px; top: 0px" onclick="getLink('<?= $element['File_Path'] ?>')" class="ti-close btn--close"></em></td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>



<table class="table margin-table">
<thead>
<form class="fix-pos" action="Home/Upload" method="post" enctype="multipart/form-data">
      <tr>
        <td><input type="file" class="form-control" name="fileToUpload" id="fileToUpload"></td>
      </tr>
        <input class="abs-pos" name="file-submit" type="submit" value="Thêm file">
</form>
</thead>
</table>