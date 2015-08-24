module Twd97
  class << self
    def convert(x, y)
      x = x.to_f
      y = y.to_f
      a = 6378137.0
      b = 6356752.314245
      lng0 = 121 * Math::PI / 180
      k0 = 0.9999
      dx = 250000
      dy = 0
      e = ((1 - (b ** 2) / (a ** 2)) ** 0.5)
      x -= dx
      y -= dy
      mm = y / k0
      mu = mm / (a * (1.0 - (e ** 2) / 4.0 - 3 * (e ** 4) / 64.0 - 5 * (e ** 6) / 256.0))
      e1 = (1.0 - ((1.0 - (e ** 2)) ** 0.5)) / (1.0 + ((1.0 - (e ** 2)) ** 0.5))
      j1 = (3 * e1 / 2 - 27 * (e1 ** 3) / 32.0)
      j2 = (21 * (e1 ** 2) / 16 - 55 * (e1 ** 4) / 32.0)
      j3 = (151 * (e1 ** 3) / 96.0)
      j4 = (1097 * (e1 ** 4) / 512.0)
      fp = mu + j1 * Math.sin(2 * mu) + j2 * Math.sin(4 * mu) + j3 * Math.sin(6 * mu) + j4 * Math.sin(8 * mu)
      e2 = ((e * a / b) ** 2)
      c1 = (e2 * Math.cos(fp) ** 2)
      t1 = (Math.tan(fp) ** 2)
      r1 = a * (1 - (e ** 2)) / ((1 - (e ** 2) * (Math.sin(fp) ** 2)) ** (3.0 / 2.0))
      n1 = a / ((1 - (e ** 2) * (Math.sin(fp) ** 2)) ** 0.5)

      dd = x / (n1 * k0)
      q1 = n1 * Math.tan(fp) / r1
      q2 = ((dd ** 2) / 2.0)
      q3 = (5 + 3 * t1 + 10 * c1 - 4 * (c1 ** 2) - 9 * e2) * (dd ** 4) / 24.0
      q4 = (61 + 90 * t1 + 298 * c1 + 45 * (t1 ** 2) - 3 * (c1 ** 2) - 252 * e2) * (dd ** 6) / 720.0
      lat = fp - q1 * (q2 - q3 + q4)
      q5 = dd
      q6 = (1 + 2 * t1 + c1) * (dd ** 3) / 6
      q7 = (5 - 2 * c1 + 28 * t1 - 3 * (c1 ** 2) + 8 * e2 + 24 * (t1 ** 2)) * (dd ** 5) / 120.0
      lng = lng0 + (q5 - q6 + q7) / Math.cos(fp)
      lat = (lat * 180) / Math::PI
      lng = (lng * 180) / Math::PI
      { lat: lat, lng: lng }
    end
  end
end
