extern crate noise;

use noise::utils::*;
use noise::{BasicMulti, Billow, Clamp, Fbm, HybridMulti, OpenSimplex, Perlin, RidgedMulti, Turbulence};

fn main() {
    let perlin = Perlin::new();
    let clamp = Clamp::new(&perlin)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-perlin.png");

    let open_simplex = OpenSimplex::new();
    let clamp = Clamp::new(&open_simplex)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-simplex.png");

    let basic_multi = BasicMulti::new();
    let clamp = Clamp::new(&basic_multi)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-basicmulti.png");

    let billow = Billow::new();
    let clamp = Clamp::new(&billow)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-billow.png");

    let fbm = Fbm::new();
    let clamp = Clamp::new(&fbm)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-fbm.png");

    let hm = HybridMulti::new();
    let clamp = Clamp::new(&hm)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-hm.png");

    let rm = RidgedMulti::new();
    let clamp = Clamp::new(&rm)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-rm.png");

    let perlin = Perlin::new();
    let t = Turbulence::new(&perlin);
    let clamp = Clamp::new(&t)
        .set_lower_bound(0.0)
        .set_upper_bound(0.25);

    PlaneMapBuilder::new(&clamp)
        .set_is_seamless(true)
        .set_size(500, 500)
        .build()
        .write_to_file("caves-turbulence.png");
}
