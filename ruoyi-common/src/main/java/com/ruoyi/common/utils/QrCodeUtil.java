package com.ruoyi.common.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import javax.swing.filechooser.FileSystemView;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class QrCodeUtil {

    public static void main(String[] args) {
        String url = "{\"msg\":\"操作功\",\"code\":200,\"data\":{\"patrolPointLatitude\":23.45656000,\"patrolPointLongitude\":23.45656000,\"patrolPointAltitude\":23.45656000}}";
        String path = FileSystemView.getFileSystemView().getHomeDirectory() + File.separator + "testQrcode";
        String fileName = "temp.jpg";
        String title = "编号1";
        createQrCode(url, path, fileName, title);
    }

    public static String createQrCode(String url, String path, String fileName, String title) {
        try {
            Map<EncodeHintType, String> hints = new HashMap<>();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            BitMatrix bitMatrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, 400, 400, hints);
            addTitle(bitMatrix, path, fileName, title);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static void addTitle(BitMatrix bitMatrix, String path, String fileName, String title) throws Exception {

        BufferedImage image = toBufferedImage(bitMatrix);
        int textHeight = 26;
        int textMargin = 10;
        BufferedImage outImage = new BufferedImage(image.getWidth(), image.getHeight() + textHeight + (textMargin * 2), BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D outg = outImage.createGraphics();
        // 画二维码到新的面板
        outg.drawImage(image, 0, 0, image.getWidth(), image.getHeight(), null);
        outg.setFont(new Font("宋体", Font.BOLD, 26)); // 字体、字型、字号
        int strWidth = outg.getFontMetrics().stringWidth(title);
        outg.setColor(Color.BLACK);
        outg.drawString(title, (outImage.getWidth() - strWidth) / 2, outImage.getHeight() - textMargin);
        outg.dispose();


        File file = new File(path, fileName);
        if (file.exists() || ((file.getParentFile().exists() || file.getParentFile().mkdirs()) && file.createNewFile())) {
            writeToFile(outImage, "png", file);
            System.out.println("搞定：" + file);
        }
    }

    static void writeToFile(BufferedImage outImage, String format, File file) throws IOException {
        if (!ImageIO.write(outImage, format, file)) {
            throw new IOException("Could not write an image of format " + format + " to " + file);
        }
    }

    static void writeToStream(BufferedImage outImage, String format, OutputStream stream) throws IOException {
        if (!ImageIO.write(outImage, format, stream)) {
            throw new IOException("Could not write an image of format " + format);
        }
    }

    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;

    private static BufferedImage toBufferedImage(BitMatrix matrix) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
            }
        }
        return image;
    }
}
