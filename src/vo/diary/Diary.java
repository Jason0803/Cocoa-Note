package vo.diary;

public class Diary {
	protected int no;
	protected String id; // (Member.id)
	
	public Diary() {
		super();
	}

	public Diary(String id) {
		this.id = id;
	}
	
	public Diary(int no, String id) {
		super();
		this.no = no;
		this.id = id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Diary [no=" + no + ", id=" + id + "]";
	}
}
