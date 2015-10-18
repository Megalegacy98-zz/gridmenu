tx, ty = Controls.readTouch()
x = 30
y = 32
color = Color.new(123,98,249)
video = Screen.loadImage(System.currentDirectory() .. "/images/video.png") 
music = Screen.loadImage(System.currentDirectory() .. "/images/music.png")
text = Screen.loadImage(System.currentDirectory() .. "/images/text.png")
sys = Screen.loadImage(System.currentDirectory() .. "/images/sys.png")
localwire = Screen.loadImage(System.currentDirectory() .. "/images/localwire.png")
launchgame = Screen.loadImage(System.currentDirectory() .. "/images/launchgame.png")

function LoadThemeImages()  --Function for loading images
	local top = Screen.loadImage(System.currentDirectory() .. "/theme/top.png")
	local bottom = Screen.loadImage(System.currentDirectory() .. "/theme/bottom.png")
	if System.doesFileExist("/theme/top.png") then 
		local top = true
	else 
		local top = false
	end 
	
	if System.doesFileExist("/theme/bottom.png") then 
		local bottom = true
	else 
		local bottom = false 
	end 
	
	if top == true then
		Screen.drawImage(0,0,top,TOP_SCREEN)
	elseif top == false then
		local top = nil
	end
	
	if bottom == true then
		Screen.drawImage(0,0,bottom,BOTTOM_SCREEN)
	elseif bottom == false then
		local bottom = nil
	end
end	
		
function LoadThemeMusic() --Function for loading theme music
	music = Sound.loadWav(System.currentDirectory() .. "/theme/bg.wav",true)
	if System.doesFileExist("/theme/bg.wav") then 
		local play = true 
	else
		local play = false
	end 
	
	Sound.updateStream()
	
	if music == true then
		Sound.play(play,LOOP,0x09)
	elseif music == false then
		local music = nil
	end
end

--Yay menu code

while true do
	Screen.waitVblankStart()
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.clear(BOTTOM_SCREEN)
	Screen.drawImage(x,y,launchgame,BOTTOM_SCREEN)
	Screen.drawImage(x + 93,y,video,BOTTOM_SCREEN)
	Screen.drawImage(x + 93,y,music,BOTTOM_SCREEN)
	Screen.drawImage(x - 186,y + 99,text,BOTTOM_SCREEN)
	Screen.drawImage(x + 93,y,sys,BOTTOM_SCREEN)
	Screen.drawImage(x + 93,y,localwire,BOTTOM_SCREEN)
		if (tx >= x) and (tx <= x + 72) and (ty >= y) and (ty <= y + 72) then
				if not Controls.check(oldpad, KEY_TOUCH) then
					Screen.clear(BOTTOM_SCREEN)
					Screen.clear(TOP_SCREEN)
					Screen.debugPrint(0,0,"Launching Game Cartridge...",color,TOP_SCREEN)
					System.launchGamecard()
			    end
		if (tx >= x + 30) and (tx <= x + 102) and (ty >= y) and (ty <= y + 72) then		
				if not Controls.check(oldpad, KEY_TOUCH) then
					dofile(System.currentDirectory.."/scripts/video.lua")
				end
		end						
	Screen.flip()
end
