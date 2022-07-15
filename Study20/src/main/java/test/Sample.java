package test;

public class Sample {
	public String name="홍길동";
	public int age=19;
	public String address="서울시 강동구";
	public String make=null;
	
	public String makeTable(int a, int b) {
		String table="<table>";
		for(int i=1; i<=a; i++) {
			
			table+="<tr>";
			for(int j=1; j<=b; j++) {
				table+="<td style='border: 1px solid black;'>";
				table+=i;
				table+=", ";
				table+=j;
				table+="</td>";		
			}
			table+="</tr>";
		}
		table+="</table>";
		return table;
	}
	public Sample(int a, int b)	{
		make=makeTable(a,b);
	}
}
