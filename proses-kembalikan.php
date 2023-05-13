<?php
	$koneksi = mysqli_connect("localhost", "root", "", "db_pinjam_barang");
	if(isset($_GET['id'])){
		$id = $_GET['id'];
		$query_search_pinjam = mysqli_query($koneksi, "SELECT * FROM tbl_pinjam WHERE id='$id'");
		$data_pinjam  		 = mysqli_fetch_array($query_search_pinjam);
		$nama_barang  		 = $data_pinjam['nama_barang'];
		$merk_barang  		 = $data_pinjam['merk_barang'];
		$peminjam			 = $data_pinjam['peminjam'];
		$level				 = $data_pinjam['level'];
		$jml_barang			 = $data_pinjam['jml_barang'];
		$tahun_barang  		 = $data_pinjam['tahun_barang'];
		$tgl_pinjam			 = $data_pinjam['tgl_pinjam'];
		$tgl_kembali		 = $data_pinjam['tgl_kembali'];

		$query_search_barang = mysqli_query($koneksi, "SELECT * FROM tbl_barang WHERE nama_barang = '$nama_barang'");
		$data_search_barang  = mysqli_fetch_array($query_search_barang);
		if($query_search_barang){		
			$query_request_kembali = mysqli_query($koneksi, "INSERT INTO tbl_req_kembali (nama_barang, merk_barang, peminjam, level, jml_barang, tahun_barang, tgl_pinjam, tgl_kembali) VALUES ('$nama_barang', '$merk_barang','$peminjam', '$level', '$jml_barang', '$tahun_barang', '$tgl_pinjam', '$tgl_kembali')");
			if($query_request_kembali){
				$query_delete_pinjam = mysqli_query($koneksi, "DELETE FROM tbl_pinjam WHERE id='$id'");
				if($query_delete_pinjam){
					echo "<script>alert('Berhasil Request Pengembalian Barang');</script>";
					header("location: barang-dipinjam.php?username=$peminjam");
				}else{
					echo "Gagal Delete tbl_pinjam";
				}
			}else{
				echo "Gagal Insert data ke tbl_req_kembali";
			}	
		}else{
			echo "Gagal Mencari Barang";
		}
	}
?>