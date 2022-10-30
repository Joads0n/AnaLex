package src;


import java.io.IOException;
import java.io.StringReader;

public class TesteLex {

	public static void main(String[] args) throws IOException {
		
		String expressao = "if float IF String (i=0; i<=9: i++); : || true ou false % * =";
		
		AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(expressao));
		lexical.yylex();
	}

}
