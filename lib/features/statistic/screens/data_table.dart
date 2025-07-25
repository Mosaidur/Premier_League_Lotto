import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamTablePage extends StatelessWidget {
  final List<Map<String, dynamic>> teamData;
  const TeamTablePage({super.key, required this.teamData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const TableHeader(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0x80FFFFFF), // 50% opacity white
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: teamData.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final team = teamData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      child: Text(
                        '${team['position']}.',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: team['logo'] != null
                          ? ClipOval(
                        child: Image.asset(
                          team['logo'],
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      )
                          : const Icon(Icons.sports_soccer, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Text(
                        team['club'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text('${team['pl']}', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text('${team['w']}', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text('${team['d']}', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text('${team['l']}', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text('${team['gd']}', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text('${team['pts']}', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 30,
          child: Text('Pos', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: 40,
          child: Text('',), // Empty for the logo space
        ),
        SizedBox(width: 8),
        Expanded(
            flex: 3,
            child: Text('Club', style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
          child: Text('PL', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Text('W', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Text('D', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Text('L', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Text('GD', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Text('PTS', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
