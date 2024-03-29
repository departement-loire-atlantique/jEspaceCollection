package fr.digiwin.module.espacecollection.exportZip;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import com.jalios.jcms.servlet.BinaryFileServlet.DownloadTicket;
import com.jalios.util.Util;

import generated.CarouselElement;

public class ExportZip {

	public List<File> listImage(CarouselElement[] galerieVisuel) {
		List<File> listFile = new ArrayList<File>();
		for (CarouselElement element : galerieVisuel) {
			File newFile = new File("jcms\\" + element.getImage()); // hmm
			listFile.add(newFile);
		}
		return listFile;
	}

	public DownloadTicket exportZip(CarouselElement[] galerieVisuel, String filename) {
		String newFilename = filename.replace(" ", "_");
		List<File> files = listImage(galerieVisuel);
		DownloadTicket ticket = null;

		try {
			// Zip content into a temp file
			File tempFile = File.createTempFile("JcmsPluginPopExplorerZipDownload.", ".zip");
			// zos is final !!
			try (final ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(tempFile)))) {

				byte[] buf = new byte[1024];
				for (int i = 0; i < files.size(); i++) {
					FileInputStream in = new FileInputStream(files.get(i).getCanonicalFile());
					// add ZIP entry to output stream
					zos.putNextEntry(new ZipEntry(files.get(i).getName()));
					// transfer bytes from the file to the ZIP file
					int len;
					while ((len = in.read(buf)) > 0) {
						zos.write(buf, 0, len);
					}
					// complete the entry
					zos.closeEntry();
					in.close();
				}

				// ZIP build
				String zipName = newFilename + "_Images.zip";
				ticket = new DownloadTicket(tempFile, "application/zip", zipName);
				ticket.setDeleteFileAfterDelivery(true);
				ticket.setUsePragmaNoCache(true);
				// ticket.sendToDownloadUrl(request, response);

			} catch (IOException e) {
				System.out.println("ioexception1");
			}
		} catch (IOException e) {
			System.out.println("ioexception2");
		}
		return ticket;
	}
}