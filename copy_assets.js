import fs from 'fs';
import path from 'path';

const brainDir = `C:\\Users\\A.J Computer's\\.gemini\\antigravity\\brain\\9a720774-5310-4165-a925-21d5d24c05bf`;
const publicDir = `C:\\Users\\A.J Computer's\\.gemini\\antigravity\\scratch\\gloom_landscaping_website\\public\\images`;

if (!fs.existsSync(publicDir)) {
  fs.mkdirSync(publicDir, { recursive: true });
}

const map = {
  'hero_dubai_villa_1786630844112.jpg': 'hero_dubai_villa.jpg',
  'service_landscape_design_1786630862573.jpg': 'service_landscape_design.jpg',
  'service_garden_maint_1786630886706.jpg': 'service_garden_maintenance.jpg',
  'service_pool_const_1786630917713.jpg': 'service_pool_construction.jpg',
  'service_artif_grass_1786630953114.jpg': 'service_artificial_grass.jpg',
  'service_pergola_1786630994714.jpg': 'service_pergola.jpg'
};

for (const [src, dest] of Object.entries(map)) {
  const srcPath = path.join(brainDir, src);
  const destPath = path.join(publicDir, dest);
  if (fs.existsSync(srcPath)) {
    fs.copyFileSync(srcPath, destPath);
    console.log(`Copied ${src} -> ${dest}`);
  } else {
    console.warn(`File not found: ${srcPath}`);
  }
}
