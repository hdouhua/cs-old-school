package cs;

public class FloatPrecision {
  public static void main(String[] args) {
    NormalSummation();
    KahanSummation();
  }

  public static void NormalSummation() {
    float sum = 0.0f;
    for (int i = 0; i < 20000000; i++) {
      //float x = 1.0f;
      sum += 1.0f;
    }
    System.out.println("sum is " + sum);
  }

  /**
   * 解决浮点数精度带来的“大数吃小数”问题
   * https://en.wikipedia.org/wiki/Kahan_summation_algorithm
   */
  public static void KahanSummation() {
    float sum = 0.0f;
    float c = 0.0f;
    for (int i = 0; i < 20000000; i++) {
      float x = 1.0f;
      float y = x - c;
      float t = sum + y;
      c = (t - sum) - y;
      sum = t;
    }
    System.out.println("sum is " + sum);
  }

}