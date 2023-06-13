package com.ruoyi.common.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Hashtable;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class QrCodeCreateUtil {


    /**
     * 生成包含字符串信息的二维码图片
     *
     * @param content     二维码携带信息
     * @param qrCodeSize  二维码图片大小
     * @throws WriterException
     * @throws IOException
     */
    public static BufferedImage createQrCode(String content, int qrCodeSize, String title, Long userId)
            throws WriterException, IOException {
        // 设置二维码纠错级别ＭＡＰ
        Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<EncodeHintType, ErrorCorrectionLevel>();
        hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L); // 矫错级别
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        // 创建比特矩阵(位矩阵)的QR码编码的字符串
        BitMatrix byteMatrix = qrCodeWriter.encode(content, BarcodeFormat.QR_CODE, qrCodeSize, qrCodeSize, hintMap);
        // 使BufferedImage勾画QRCode (matrixWidth 是行二维码像素点)
        int matrixWidth = byteMatrix.getWidth();
        int picWidth = matrixWidth - 200;
        int picHeight = matrixWidth - 50;// 除掉二维码过长的底部留白
        BufferedImage image = new BufferedImage(picWidth, picHeight, BufferedImage.TYPE_INT_RGB);
        image.createGraphics();
        Graphics2D graphics = (Graphics2D) image.getGraphics();
        // 画二维码
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, matrixWidth, matrixWidth);
        // 使用比特矩阵画并保存图像
        graphics.setColor(Color.BLACK);
        for (int i = 0; i < matrixWidth; i++) {
            for (int j = 0; j < matrixWidth; j++) {
                if (byteMatrix.get(i, j)) {
                    graphics.fillRect(i - 100, j - 100, 1, 1);
                }
            }
        }
        graphics.setColor(Color.BLACK);
        Font font = new Font("黑体", Font.BOLD, 150); // 设置底部文字
        graphics.setFont(font);
        graphics.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON); // 消除文字锯齿
        // 计算文字长度，计算居中的x点坐标
        FontMetrics fm = graphics.getFontMetrics(font);
        int textWidth = fm.stringWidth(title);
        int widthX = (picWidth - textWidth) / 2;
        graphics.drawString(title, widthX, image.getHeight() - 50);
        graphics.dispose();
        if (userId.equals(1L)){
            return resize(image, 600, 600);
        }else {
            return resize(image, 100, 100);
        }
    }
    /**
     * 设置图片大小，并在底部加上字
     *
     */
    public static BufferedImage resize(BufferedImage img, int newW, int newH) {
        Image tmp = img.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
        BufferedImage dimg = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = dimg.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return dimg;
    }

    public static InputStream bufferedImageToInputStream(BufferedImage image) throws IOException {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(image, "JPEG", os);
        return new ByteArrayInputStream(os.toByteArray());
    }

}
