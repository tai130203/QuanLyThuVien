package Vew;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class AboutUsView extends JFrame{
	public AboutUsView()
	{
		this.init();
		this.setVisible(true);
	}
	private void init()
	{
		this.setLayout(new BorderLayout());
		this.setSize(500, 800);
		this.setTitle("ABOUT US");
		
		Font font = new Font("Arial", Font.BOLD, 40);
		
		JLabel jlaHead = new JLabel("Giới thiệu chung", JLabel.CENTER);
		jlaHead.setFont(font);
		jlaHead.setForeground(Color.GREEN);
		
		Font fonjtext = new Font("Arial", Font.TYPE1_FONT, 20);
		
		JTextArea jtexIntro = new JTextArea("Thư viện Trung tâm cung cấp nguồn tài nguyên "
				+ "\nthông tin khoa học và các dịch vụ hỗ trợ "
				+ "\ncho cán bộ giảng viên, "
				+ "\nnhà nghiên cứu và sinh viên của ĐHQG-HCM nhằm phục vụ mục tiêu đào tạo và "
				+ "\nnghiên cứu chất lượng cao của ĐHQG-HCM. "
				+ "\nVới vai trò của một thư viện chính trong Hệ thống Thư viện ĐHQG-HCM, "
				+ "\nThư viện Trung tâm có nhiệm vụ điều hành hệ thống, "
				+ "\ntổ chức các hoạt động liên kết, chia sẻ "
				+ "\ncác nguồn lực chung của hệ thống. Hệ thống Thư viện ĐHQG-HCM được "
				+ "\ntổ chức và hoạt động theo Quy chế ban hành "
				+ "\nkèm theo Quyết định số 165/ QĐ-ĐHQG-TCCB ngày 24 tháng 2 năm 2009."
				+ "\nHệ thống Thư viện ĐHQG-HCM gồm Thư viện "
				+ "\nTrung tâm và 08 thư viện "
				+ "\ncủa các trường đại học và viện thành viên thuộc ĐHQG-HCM (TV Trường ĐH Bách Khoa,"
				+ "\nTV Trường ĐH Khoa học Tự nhiên, TV Trường ĐH Khoa học Xã hội & Nhân văn, "
				+ "\nTV Trường ĐH Quốc tế, TV Trường ĐH Kinh tế - Luật, "
				+ "\nTV Trường ĐH Công nghệ Thông tin, TV Trường ĐH An Giang, TV Viện Môi trường & Tài nguyên)."
				+ "\nNguồn tài liệu của Thư viện Trung tâm được chú trọng phát triển cả về số lượng và chất lượng, "
				+ "\ncó giá trị học thuật cao theo yêu cầu và triển khai dùng chung trong toàn hệ thống. "
				+ "\nTính đến 9/2021, tài liệu bản in phục vụ chung trong toàn "
				+ "\nhệ thống thư viện ĐHQG-HCM hiện có: 632.000 bản sách, "
				+ "\ntrong đó Thư viện Trung tâm có hơn 98.000 bản (49.300 nhan đề); "
				+ "\nngoài ra còn có Tạp chí (495 nhan đề), "
				+ "\nLuận án (567 nhan đề),… Bên cạnh nguồn tài liệu bản in, Thư viện Trung tâm chú trọng đầu tư và "
				+ "\ntriển khai phục vụ trên 20 cơ sở dữ liệu trực tuyến với "
				+ "\nnhiều cơ sở dữ liệu khoa học uy tín của các "
				+ "\nnhà xuất bản nước ngoài (ScienceDirect, ACS, IEEE Xplore, SpringerLink, SpringerOpen, Nature, Harvard"
				+ " \nBusiness Review, Ovid, Proquest Central,…) với các loại hình tài liệu điện tử đa dạng: sách điện tử (19.000), "
				+ "tạp chí điện tử (31,900), luận án – luận văn điện tử (102.300), khoá học/tài liệu đa phương tiện (11.050.000).\r\n"
				+ "\r\n"
				+ "       Các nguồn tài liệu phong phú nêu trên được kết nối phục vụ chung trong toàn ĐHQG-HCM thông qua "
				+ "\nhệ thống phần mềm quản lý thư viện nền tảng dịch vụ, phần mềm tìm kiếm tập trung, phần mềm quản lý người dùng. "
				+ "\nHệ thống phần mềm này giúp cho việc tìm kiếm tập trung tất cả nguồn tài liệu bản in và tài liệu điện tử của các "
				+ "\nthư viện trong hệ thống một cách thuận tiện đối với người sử dụng và việc quản lý người dùng được đồng bộ và hiệu quả hơn.");
		jtexIntro.setForeground(Color.blue);
		jtexIntro.setFont(fonjtext);
		JScrollPane jScrollpane = new JScrollPane(jtexIntro);
		
		this.add(jScrollpane, BorderLayout.CENTER);
		this.add(jlaHead, BorderLayout.NORTH);
		
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
