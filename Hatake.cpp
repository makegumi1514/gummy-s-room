#include "Main.h"

//”¨‚Ì‰Šú‰»
void CHatake::Reset(){
	Model = GetModel(L"cube.x");
	Color = CColor(1, 1, 1, 0);
	Scale = CVector(6, 0.5f, 6);

	for (int z = -1; z <= 1; z++){
		for (int x = -1; x <= 1; x++){
			int index = (x + 1) + (z + 1) * 3;
			localBlock[index] = New<CBlock>(BLOCKTYPE::SOIL, CVector(this->Position.X + x * 3, this->Position.Y, this->Position.Z + z * 3));
		}
	}

	soil = 0;
	it = 0;
	growFrag = false;
}

//”¨‚ÌˆÚ“®
void CHatake::Move(){
	if (soil > 2){
		/*if (Type == HATAKETYPE::JAGAHATAKE){
			while (localBlock[it]->vegFrag != true){
				New<CBlock>(BLOCKTYPE::JAGA, localBlock[it]->Position.XFZ(1));
				localBlock[it]->vegFrag = true;
				it++;
				break;
			}
		}
		if (Type == HATAKETYPE::NINJINHATAKE){
			while (localBlock[it]->vegFrag != true){
				New<CBlock>(BLOCKTYPE::NINJIN, localBlock[it]->Position.XFZ(1));
				localBlock[it]->vegFrag = true;
				it++;
				break;
			}
		}*/
		/*BlockList.Apply([&](CMover* b){
			if (b->Type == BLOCKTYPE::SOIL){
				if (Type = HATAKETYPE::NINJINHATAKE){
					New<CBlock>(BLOCKTYPE::NINJIN, b->Position.XFZ(1));
				}
				if (Type = HATAKETYPE::JAGAHATAKE){
					New<CBlock>(BLOCKTYPE::JAGA, b->Position.XFZ(1));
				}
				growFrag = true;
			}
		});*/
		for (int i = 0; i < 9; i++){
			if (Type == HATAKETYPE::JAGAHATAKE){
				New<CBlock>(BLOCKTYPE::JAGA, localBlock[i]->Position.XFZ(0.7f));
			}
			if (Type == HATAKETYPE::NINJINHATAKE){
				New<CBlock>(BLOCKTYPE::NINJIN, localBlock[i]->Position.XFZ(0.7f));
			}
		}
		soil -= 2;
	}
}

//”ì—¿‚ÌƒCƒ“ƒNƒŠƒƒ“ƒg
void CHatake::CountUp(){
	soil++;
}