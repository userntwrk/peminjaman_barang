<?php
	if(isset($_GET['username'])){
		$username = $_GET['username'];
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Peminjaman Instrumen Lab</title>
	<link rel="stylesheet" type="text/css" href="tambahan/bootstrap-4.1.3/dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="tambahan/bootstrap-4.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/register-style.css">
	<link rel="stylesheet" type="text/css" href="tambahan/font-awesome/css/font-awesome.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body  style="background-image: url('') !important;">
	<div class="container">
		<div class='row'>
			<div class="col-md-2" style="padding-top: 20px;">
				<a href="index.php" class="btn btn-info btn-icon btn-sm">
					<i class="fa fa-arrow-left"></i>
				</a>
			</div>
			<div class="col-md-8 form-register-container">
				<h2>Data Barang Dipinjam</h2>
				<table class="table table-bordered table-super-condensed">
					<thead>
						<tr>
							<th>No</th>
							<th>Nama Barang</th>
							<th>Merk Barang</th>
							<th>Jumlah Barang</th>
							<th>Tahun Barang</th>
							<th>Tgl Pinjam</th>
							<th>Tgl Kembali</th>
							<th>Opsi</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$koneksi = mysqli_connect("localhost", "root", "", "db_pinjam_barang");
							$query = mysqli_query($koneksi, "SELECT * FROM tbl_pinjam WHERE peminjam='$username'");
							if(mysqli_num_rows($query) == 0){
								echo "<tr><td colspan='6'>belum ada data!</td></tr>";
							}else{
								$no = 1;
								while ($data = mysqli_fetch_array($query)) {
							?>
									<tr>
										<td><?php echo $no;?></td>
										<td><?php echo $data['nama_barang'];?></td>
										<td><?php echo $data['merk_barang'];?></td>
										<td><?php echo $data['jml_barang'];?></td>
										<td><?php echo $data['tahun_barang'];?></td>
										<td><?php echo $data['tgl_pinjam'];?></td>
										<td><?php echo $data['tgl_kembali'];?></td>
										<td>
											<a href="proses-kembalikan.php?id=<?php echo $data['id'];?>" class="btn btn-success btn-sm">
												<i class="fa fa-check"></i>
												Kembalikan
											</a>
										</td>
									</tr>
							<?php
									$no++;
								}
							}
						?>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="tambahan/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="tambahan/bootstrap-4.1.3/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="tambahan/bootstrap-4.1.3/dist/js/bootstrap.min.js"></script>

</body>
</html>